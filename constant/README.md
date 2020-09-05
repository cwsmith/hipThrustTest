## contents
README.md - this file
build.sh - build script
envCoronaRocm.sh - environment script
forEach.cu - source

## build

```
source envCoronaRocm.sh
./build.sh
```

## run

```
salloc -N 1 -p mi60 -t 10
source envCoronaRocm.sh
./forEach
```

## discussion

Commenting line 10 and uncommenting line 11 or 12, then building following the
instructions above, will result in `undefined symbol: foo` errors:

```
+ hipcc -std=c++11 --amdgpu-target=gfx906 forEach.cu -o forEach
lld: error: undefined symbol: foo
>>> referenced by /var/tmp/smith516/forEach-f6d9ed-gfx906-aed70a.o:(void thrust::hip_rocprim::__parallel_for::kernel<256u, 1u, thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long>(thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long))
>>> referenced by /var/tmp/smith516/forEach-f6d9ed-gfx906-aed70a.o:(void thrust::hip_rocprim::__parallel_for::kernel<256u, 1u, thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long>(thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long))
>>> referenced by /var/tmp/smith516/forEach-f6d9ed-gfx906-aed70a.o:(void thrust::hip_rocprim::__parallel_for::kernel<256u, 1u, thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long>(thrust::hip_rocprim::for_each_f<thrust::detail::normal_iterator<thrust::device_ptr<int> >, thrust::detail::wrapped_function<main::'lambda'(int), void> >, long))
>>> referenced 1 more times
clang-11: error: amdgcn-link command failed with exit code 1 (use -v to see invocation)
```




