# dockerfiles

## Recommended setup

- Create SSH key on Tchai: `ssh-keygen`
- Display and copy the public key `cat ~/.ssh/id_rsa`
- Go to GitHub > Settings > SSH and GPG Keys
- Click 'New SSH Key' and paste the SSH key.
- Then, on Tchai, do: `git clone ...` (this repo and other repos)
- Open the project folder in VS Code using [Remote SSH extension](https://code.visualstudio.com/docs/remote/ssh).

## Running the Docker images

Run one of the following, depending on what you're working on:
```
docker run -it --gups 'device=0' lanternerds/hdr-nerf
docker run -it --gups 'device=0' lanternerds/hdr-plenoxel
docker run -it --gups 'device=0' lanternerds/nerfstudio-hdr
```

> Note: We specify device=0 since we _only_ have access to the 24 GB Titan RTX on Tchai. Otherwise, we can ask Christophe for GPU 1.


## Buidling the Docker images

> Note: this is only needed if you need to change the software/libraries installed in the Docker images. Changing the code of the Python project doesn't require a rebuild.

- Building all images:
   ```
   bash build_all.sh
   ```
- Building a single image (change `<name>` to hdr-nerf, hdr-plenoxel or nerfstudio-hdr)
   ```
   docker build . -t lanternerds/<name>
   ```


## todo
 - Figure out nvidia-container-toolkit error on images that used to work
 - Make usage guide
 - nerfstudio-hdr
    - Mount local repo to container instead of cloning into image
 - HDR-Plenoxels
    - Don't run pip as root to prevent warnings
