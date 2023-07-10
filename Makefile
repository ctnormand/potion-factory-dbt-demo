container_name := dbt-demo

.PHONY: start
start:
	@docker build -t $(container_name) .
	@docker run --rm -v $(shell pwd):/usr/src/dbt-demo $(container_name) build
	@docker run --rm -v $(shell pwd):/usr/src/dbt-demo $(container_name) docs generate
	@docker run --rm -v $(shell pwd):/usr/src/dbt-demo -p 8080:8080 $(container_name) docs serve

.PHONY: clean
clean:
	@rm -f potion_factory/*.duckdb
	@rm -rf potion_factory/dbt_packages
	@rm -rf potion_factory/logs
	@rm -rf potion_factory/target
