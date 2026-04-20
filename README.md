# Ollama-And-Opeb-Webui
Custom script to launch ollama and open-webui locally in linux

## Installation

Download and run the script:
```bash
curl -fsSL https://raw.githubusercontent.com/spart4ck/Ollama-And-Opeb-Webui/refs/heads/main/ollama_openwebui.sh -o start_ollama_openwebui.sh
chmod +x start_ollama_openwebui.sh
```
Move the script to any of the binary paths (e.g. $HOME/.local/bin)
```
echo $PATH
```

### Usage
```bash
./start_ollama_openwebui.sh          # start (default)
./start_ollama_openwebui.sh update   # update open-webui
./start_ollama_openwebui.sh stop     # stop services
