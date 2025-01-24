# Docker Image for HLA typing from RNA-seq data

For more information on arcasHLA, check the [arcasHLA GitHub page](https://github.com/RabadanLab/arcasHLA/tree/master)

# Build the docker images

From the project folder, run the command below:

```bash build.sh```

# Run docker container

## Jupyter Lab approach

From the project folder, run the command below:

```docker-compose up```

Which fires a Jupyter Lab server.

## Alternative approach

From the project folder, run the command below:

```docker-compose up -d```

This command starts the container in the background. If you want to interact with it, you can attach to it using:

```docker exec -it hlatyping-env /bin/bash```