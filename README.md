# Vue 3 + TypeScript + Vite

Sets up a super basic example of using GLTFLoader with a vue project

## run in Docker
    #### first run : 
        docker-compose up --build --no-recreate -d
    #### From the second time, we can use:
        docker-compose up -d
## after run docker container
    docker exec -it vite_docker sh
        #### first time run:
            npm i && npm run dev
        #### From the second time, we can use:
            npm run dev