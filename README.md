# official CrowdRender-Server docker image w/ GPU support
[GitHub repo](https://github.com/crowdrender/cr-docker) 

### most important tags

- `bl_2.81`, `latest`, `nvidia` *(Blender 2.81a)*
- `bl_2.79`, `bl_2.79_cu_10.1` *(Blender 2.79)*


## Instructions for CPU

Installation instructions for docker itself can be found [here](https://docs.docker.com/install/linux/docker-ce/debian/) or you can use [this](https://get.docker.com/) this installation script for quick & easy install.

To start the docker image run:

```
docker run -t \
 --name "Crowdrender-Server" \
 --token=<login_token> \
 --net=host \
zocker160/blender-crowdrender:latest
```

Now you should be able add the server to the list of render nodes.

The CrowdRender documentation can be found [here](https://www.crowd-render.com/learn).


## Usage

- `--name` here you can set the name of the docker image
- `--token` this is mandatory in order to download the lastest CR version and for the connection to the CR server
_(you can get a token from [here](https://discovery.crowd-render.com/profile))_
- `--net=host` this sets the image to run in the `host`-network

#### optional parameters:

- `-e CR_VERSION=<cr_version>`

**(the default value is always the latest version of CrowdRender)**


## Version table

| Docker tag | Blender version | CR_VERSION | CrowdRender version |
| :---: | :---: | :---: | :---: |
| `bl_2.81`, `latest` | `2.81a` | `cr_022_bl280` | `0.2.2` |
||| `cr_021_bl280` | `0.2.1` |
||| `cr_020_bl280` | `0.2.0` |
||| `cr_018_bl280` | `0.1.8` |
||| `cr_017_bl280` | `0.1.7` |
||| `cr_016_bl280` | `0.1.6` |
||| `cr_016_bl280_b` | `0.1.6b` |
||| `cr_016_bl280_c` | `0.1.6c` |
|`bl_2.79` | `2.79b` | `cr_022_bl279` | `0.2.2` |
||| `cr_021_bl279` | `0.2.1` |
||| `cr_020_bl279` | `0.2.0` |
||| `cr_018_bl279` | `0.1.8` |
||| `cr_017` | `0.1.7` |
||| `cr_016` | `0.1.6` |
||| `cr_015` | `0.1.5` |
||| `cr_014_bl279_Patch` | `0.1.4` |

## Instructions for GPU (nvidia)

In order to make this image work, you need to have [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) installed to enable passthru on the nvidia card(s).

You will also need to have the [Nvidia-CUDA-toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64)  to be installed.

### Version table

| Docker tag | Blender | CUDA |
| :--------------: | :---------: | :-------: |
| `bl_2.81_cu_10`, `nvidia` | 2.81a | 10.2 |
| `bl_2.79_cu_10.1` | 2.79b | 10.1 |
| `bl_2.79_cu_9.2` | 2.79b | 9.2 | 
| `bl_2.79_cu_7.5` | 2.79b | 7.5 |


## Instructions

To start the docker image run:

```
docker run -t \
 --name "Crowdrender-Server" \
 --net=host \
 --token=<login_token> \
 --runtime=nvidia \
zocker160/blender-crowdrender:nvidia
```

Now you should be able add the server to the list of render nodes.

The CrowdRender documentation can be found [here](https://www.crowd-render.com/documentation-v016).


#### Usage

- `--name` here you can set the name of the docker image
- `--net=host` this sets the image to run in the `host`-network (alternatively you could forward the default ports `9000`-`9010`)
- `--runtime=nvidia` this enables the passthrough to the GPU(s)

## Extra bits

**if you have any problems or questions, you can create an [issue](https://github.com/crowdrender/cr-docker/issues) or feel free to contact us: info(at)crowdrender(dot)com(dot)au**

[DockerHub repo](https://hub.docker.com/r/zocker160/blender-crowdrender) 
[Crowdrender website](https://www.crowd-render.com/) 