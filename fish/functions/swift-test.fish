function swift-test
    set -l test_dir "test"
    set -l target "macosx-x86_64"
    
    set -l build_script_args "--release-debug"
    
    set -l lit_succinct "-s"
    set -l lit_verbose "-v"
    set -l lit_incremental "-i"
    set -le lit_other
    
    for arg in $argv
        switch $arg
            case "--validation"
                set test_dir "validation-test"
            
            case "-S" "--no-succinct"
                set -e lit_succinct[0]
            case "-s" "--succinct"
                set lit_succinct $lit_succinct "-s"
            case "-V" "--no-verbose"
                set -e lit_verbose[0]
            case "-v" "--verbose"
                set lit_verbose $lit_verbose "-v"
            case "--no-incremental"
                set -e lit_incremental[0]
            case "--incremental"
                set lit_incremental $lit_incremental "-i"
            
            case "--config-prefix" "-D*" "--param" "-q" "--quiet" "-a" "--show-all" "-o" "--output" "--no-progress-bar" "--show-unsupported" "--show-xfail" "--path" "--time-tests" "--no-execute" "--xunit-xml-output" "--timeout" "--max-failures" "--max-tests" "--max-time" "--shuffle" "--filter" "--num-shards" "--run-shard" "--show-suites" "--show-tests" "--single-process"
                set lit_other $lit_other $arg
            
            case "-R" "--release" "-r" "--release-debug" "-d" "--debug"
                set build_script_args[0] $arg
            
            case "--target=*"
                set target (string replace -- "--target=" '' $arg)
            
            case "-*"
                set build_script_args $build_script_args $arg
            
            case "*"
                set lit_other $lit_other $arg
        end
    end
    
    set -l lit_config_path (utils/build-script $build_script_args --dump-config | jq -r .workspace.build_root)/swift-macosx-x86_64/test-$target/lit.site.cfg
    set -l lit_args $lit_succinct $lit_verbose $lit_incremental --param swift_site_config=$lit_config_path $lit_other
    echo "Running lit with args: $lit_args"
    
    set -l start_dir (pwd)
    
    cd $test_dir
    caffeinate $start_dir/../llvm/utils/lit/lit.py $lit_args
    cd -
end
