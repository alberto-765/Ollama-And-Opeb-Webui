#!/bin/env zsh


CONTAINER="open-webui"
ACTION=${1:-start} # default action is start
LOCAL_PORT=3000


run_container ()
{
  docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway \
    -v open-webui:/app/backend/data --name $CONTAINER --restart always ghcr.io/open-webui/open-webui:main
}

case $ACTION in
  start)
    if ! pgrep -x "ollama" > /dev/null ; then
      ollama serve &
    else
      echo "Ollama already running"
    fi 

    # Run if already exist or create if not
    if docker ps -a --format '{{.Names}}' | rg -q '^open-webui$';  then
      echo "The container already exists"
      docker start $CONTAINER
    else
      echo "Creating the container"
      run_container
    fi

    xdg-open "http://localhost:$LOCAL_PORT"
  ;;
  update) 
    echo "Updating open-webui container"
    docker stop $CONTAINER && docker rm $CONTAINER
    docker pull ghcr.io/open-webui/open-webui:main
    run_container

    xdg-open "http://localhost:$LOCAL_PORT"
  ;;
  stop) 
    echo "Stopping ollama and open-webui"
    docker stop $CONTAINER 
  ;;
  *)
    echo "Usage: $0 {start|update|stop}"
  ;;
esac

