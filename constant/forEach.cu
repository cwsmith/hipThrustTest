#include <thrust/device_vector.h>
#include <thrust/for_each.h>
#include <thrust/transform.h>
#include <thrust/functional.h>
#include <thrust/execution_policy.h>
#include <iostream>

#define MY_LAMBDA [=] __device__

__constant__ int const foo[2] = {1,2}; // compiles
//int const foo[2] = {1,2}; // lld: error: undefined symbol: foo
//static const int foo[2] = {1,2}; // lld: error: undefined symbol: foo

template <typename InputIterator, typename UnaryFunction>
void for_each(int first, int last, UnaryFunction&& f) {
  if (first >= last) return;
  auto const f2 = std::move(f);
  thrust::for_each(thrust::device, first, last, f2);
}

int main()
{
  thrust::device_vector<int> vec(1);
  auto f = MY_LAMBDA(int i) {
    int x = foo[0];
    int y = foo[1];
    printf("x y %d %d\n", x, y);
  };
  for_each(vec.begin(), vec.end(), f);

  return 0;
}

