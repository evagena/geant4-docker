# Geant4 Docker (with Qt/OpenGL GUI) on Linux

This repository provides a fully automated setup to run [Geant4](https://geant4.web.cern.ch/) (v11.2.1) inside a Docker container with Qt and OpenGL GUI support — specifically for Linux systems.

## ✅ Features

- Builds Geant4 11.2.1 from source
- Includes all Geant4 data libraries
- Enables GUI via Qt and OpenGL
- Runs the **B1 example** automatically
- Persistent data volume (`geant4data`) so your work is saved

---

## Getting Started

### Prerequisites

- Linux (Ubuntu, Fedora, Arch, etc.)
- [Docker](https://docs.docker.com/get-docker/) installed
- User added to Docker group:  
  ```bash
  sudo usermod -aG docker $USER
  newgrp docker

### Bonus Tip (Optional Security Note):

If your audience is technically inclined or cautious, you can optionally add:

```markdown
> To revoke access after you're done, run:
>
> ```bash
> xhost -local:root
> ```

### Installation & Run

Clone this repository and run the setup script:

```bash
git clone https://github.com/evagena/geant4-docker.git
cd geant4-docker/utils
chmod +x run_geant4_linux.sh
./run_geant4_linux.sh

  
