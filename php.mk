include github.com/msales/make/todo
include github.com/msales/make/env

# Run all tests
test:
	@vendor/bin/phpunit
.PHONY: test

# Run benchmarks
bench:
	@vendor/bin/phpbench run
.PHONY: bench

stan_path = app
ifneq ($(wildcard src),)
    stan_path = src
endif

stan_conf =
ifneq ($(wildcard phpstan.neon),)
    stan_conf = -c phpstan.neon
endif

# Run static analysis
analyse:
	@vendor/bin/phpstan analyse -l 0 $(stan_conf) $(stan_path) tests
.PHONY: analyse