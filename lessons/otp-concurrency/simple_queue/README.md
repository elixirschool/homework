# Simple Queue

Hope you liked the OTP concurrency lesson. Here is your project for it!
Look at the code in file `lib/simple_queue.exs`. It should be familiar, it's
the same `SimpleQueue` implementation as in the lesson. Consider following
modifications:

1. Change the `enqueue` function from an asynchronous to a synchronous one.

The function should preserve it's functionality, but
return the new element instead of `:ok`. The unit tests
could helpful if you get stack

2. Implement a `sum_elements` function that will output a sum of all the numbers inside the queue

The function should:
- assume that every object in the queue is an integer
- return an integer which is a sum of all numbers in the queue
- not modify the state of the queue

To run tests, make sure you `cd` into `homework/lessons/otp-concurrency/simple_queue` and execute `mix test`.

If you get stuck, you can view the solution by checking out the `solution` branch of this repo!
