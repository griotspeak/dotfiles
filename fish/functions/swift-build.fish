function swift-build
  ./swift/utils/build-script --skip-build-benchmark --skip-ios --skip-watchos --skip-tvos --swift-darwin-supported-archs "x86_64" --cmake-c-launcher=(which sccache) --cmake-cxx-launcher=(which sccache) --release-debuginfo --test
end
