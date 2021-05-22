file(REMOVE_RECURSE
  "CMakeFiles/test-package"
  "pkg/run-test.sh"
  "pkg/.options_log"
  "pkg/eyrie-rt"
  "pkg/stack"
  "pkg/loop"
  "pkg/malloc"
  "pkg/long-nop"
  "pkg/fibonacci"
  "pkg/fib-bench"
  "pkg/attestation"
  "pkg/untrusted"
  "pkg/data-sealing"
  "pkg/test-runner"
  "pkg"
  ".options_log"
  "eyrie-rt"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/test-package.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
