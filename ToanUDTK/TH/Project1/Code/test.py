def evaluate_expression(expr, var_values):
    # Split the expression into terms
    terms = expr.split('+')

    # Initialize the result
    result = 0

    # Evaluate each term
    for term in terms:
        if 'a' in term:
            # If the term contains 'a', split it into coefficient and constant
            coef, const = term.split('a')
            # If coef is empty, it means the coefficient is 1
            coef = 1 if coef == '' else int(coef)
            # Add the product of the coefficient and the value of 'a' to the result
            result += coef * var_values['a']
        else:
            # If the term doesn't contain 'a', add it to the result
            result += int(term)

    return result

# Example usage:
var_values = {'a': 0}  # Substitute 'a' with 0
expr = '5 + 3*a'
print(evaluate_expression(expr, var_values))  # Output: 5