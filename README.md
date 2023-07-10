# Potion Factory dbt Demo

[dbt](https://www.getdbt.com) is a game changing tool for data teams. What better way to demonstrate it than with a whimsical, completely made up example of a potion factory run by a data savy witch.

## Requirements

You will need to have docker installed to run this project. You can find installation instructions [here](https://www.docker.com/).

If you're on a Windows machine, you'll also need Make for Windows. The easiest way to install it is with Chocolatey, and you can find installation instructions [here](https://community.chocolatey.org/packages/make).

## Running the Project

Clone the repository and navigate to the top level directory. From your terminal, run

```shell
make start
```

It may take a few minutes for the contaier to build the first time you run it. Once the build completes and the container is running, navigate in an internet browser to `localhost:8080`. You should see the auto-generated project documentation.

## Exploring the Data

This project uses [DuckDB](https://duckdb.org/) to run transformations and persist data. On each run, dbt will leave a file called `potion_factory.duckdb` in the `potion_factory` project directory. This file is the database. You can query the data using a variety of [client APIs](https://duckdb.org/docs/api/overview).

## Cleaning Up

Press `ctrl+c` to terminate the running container. From your terminal, run

```shell
make clean
```

to get rid of unnecessary files created by the demo.

## License

[GPL-3.0](https://github.com/ctnormand1/potion-factory-dbt-demo/blob/main/LICENSE)
