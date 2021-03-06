# Development

This project is following a TDD approach.
This means, development, follows the pattern of RGR.

    R : Red => Write a test that fails
    G : Green => Write code and pass the test
    R : Refactor => Refactor the written code without breaking the test

# Red
First of all, a test is being written. You think of what task has to be performed by a class and its interface and then write a test to validate your believed functionality.

**An example:**

        Terminator
        termin = Terminator.new("Woman")
        assert(termin.should_investiage?, true)

This test will throw multiple errors. One, because the class **"Terminator"** doesn't exist yet. Another error would be, that there is no method **"should_investiage?"** for the class Terminator


# Green
So what you would do now, is to implement the bare minimum to make the test pass.
So one would implement the Terminator class and its method. Without any implementation of future features. So the only thing the method has to do at the moment is to **return true**


# Refactor

After the tests are passing, one should go back to his code and refactor parts that seem difficult to maintain and work with. Because there are no clear definitions of what that really means, every contributor is free to decide what it means to them. But please keep in mind that other people have to work with the code and may find it difficult if you try to over simplify the code.
