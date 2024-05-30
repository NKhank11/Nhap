#include <iostream>
#include <chrono>
#include <iomanip>
#include <stdexcept>

using namespace std;

class Stopwatch {
private:
    bool running;
    chrono::time_point<chrono::steady_clock> start_time;
    chrono::time_point<chrono::steady_clock> last_lap;
    int press_count;
    const int max_press_count = 5;

public:
    Stopwatch() : running(false), press_count(0) {}

    void start() {
        if (!running) {
            start_time = chrono::steady_clock::now();
            last_lap = start_time;
            running = true;
        }
    }

    void lap() {
        if (press_count >= max_press_count) {
            throw runtime_error("Exceeded maximum number of presses.");
        }
        if (running) {
            last_lap = chrono::steady_clock::now();
            press_count++;
        }
    }

    void stop() {
        if (running) {
            last_lap = chrono::steady_clock::now();
            running = false;
        }
    }

    bool isRunning() const {
        return running;
    }

    void displayTime() const {
        auto duration = chrono::duration_cast<chrono::seconds>(chrono::steady_clock::now() - start_time).count();
        int hours = duration / 3600;
        int minutes = (duration % 3600) / 60;
        int seconds = duration % 60;
        cout << "Current time: "
             << setw(2) << setfill('0') << hours << ":"
             << setw(2) << setfill('0') << minutes << ":"
             << setw(2) << setfill('0') << seconds << endl;
    }

    int getPressCount() const {
        return press_count;
    }
};

int main() {
    Stopwatch stopwatch;
    char input;

    cout << "Press Enter to start/lap the stopwatch, Space to stop it.\n";

    try {
        while (true) {
            input = cin.get();

            if (input == '\n') { // Enter key pressed
                if (!stopwatch.getPressCount() && !stopwatch.isRunning()) {
                    stopwatch.start();
                    cout << "Stopwatch started.\n";
                } else {
                    stopwatch.lap();
                }
                stopwatch.displayTime();
            } else if (input == ' ') { // Space key pressed
                stopwatch.stop();
                cout << "Stopwatch stopped.\n";
                stopwatch.displayTime();
                break;
            }
        }
    } catch (const runtime_error &e) {
        cerr << e.what() << endl;
    }

    return 0;
}
