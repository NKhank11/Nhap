#include <iostream>
using namespace std;

struct Node {
    int data;
    int priority;
    Node* next;
};

struct PriorityQueue {
    Node* head;
    Node* tail;
    int size;
};

Node* createNode(int value, int pri) {
    Node* newNode = new Node;
    newNode->data = value;
    newNode->priority = pri;
    newNode->next = NULL;
    return newNode;
}

void initQueue(PriorityQueue& pq) {
    pq.head = NULL;
    pq.tail = NULL;
    pq.size = 0;
}

bool isEmpty(PriorityQueue& pq) {
    return pq.head == NULL;
}

int peek(PriorityQueue& pq) {
    return pq.head->data;
}

void pop(PriorityQueue& pq) {
    if (isEmpty(pq)) {
        cout << "Priority Queue is empty. Cannot perform pop operation." << endl;
        return;
    }

    Node* cur = pq.head;
    pq.head = pq.head->next;
    if (pq.head == NULL) {
        pq.tail = NULL;
    }
    delete cur;
    pq.size--;
}

void push(PriorityQueue& pq, int value, int pri) {
    Node* newNode = createNode(value, pri);

    if (isEmpty(pq)) {
        pq.head = newNode;
        pq.tail = newNode;
    } else if (pri < pq.head->priority) {
        newNode->next = pq.head;
        pq.head = newNode;
    } else {
        Node* cur = pq.head;
        while (cur->next != NULL && cur->next->priority <= pri) {
            cur = cur->next;
        }
        newNode->next = cur->next;
        cur->next = newNode;
        if (newNode->next == NULL) {
            pq.tail = newNode;
        }
    }

    pq.size++;
}

void printQueue(PriorityQueue& pq) {
    if (isEmpty(pq)) {
        cout << "Priority Queue is empty." << endl;
        return;
    }

    Node* cur = pq.head;
    while (cur != NULL) {
        cout << cur->data << " ";
        cur = cur->next;
    }
    cout << endl;
}

int main() {
    PriorityQueue pq;
    initQueue(pq);

    // Push elements into the priority queue
    push(pq, 5, 2);
    push(pq, 10, 1);
    push(pq, 15, 3);

		// Sau khi thực hiện các thao tác trên hàng đợi ưu tiên
	// ...
	
	// In ra các phần tử trong hàng đợi
	cout << "Elements in the priority queue: ";
	printQueue(pq);

    // Print the front element
    cout << "Front element: " << peek(pq) << endl;

    // Pop the front element
    pop(pq);

    // Print the front element again
    cout << "Front element after pop: " << peek(pq) << endl;

    return 0;
}
