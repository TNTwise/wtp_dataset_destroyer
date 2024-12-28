input = "path/to/input"
output = "path/to/output"

degradation {
  type = "dithering"
  dithering_type =["floydsteinberg", "jarvisjudiceninke", "quantize"]
  color_ch = [32,128]
  probability = 0.5
}

degradation {
  type = "resize"
  alg_lq = ["box", "linear", "cubic_catrom", "lanczos"]
  alg_hq = ["lagrange"]
  spread = [1, 2, 0.05]
  scale = 4
  color_fix = true
  gamma_correction = false
}

degradation {
  type = "halo"
  type_halo = ["unsharp_mask"]
  kernel = [0,1]
  amount = [0,1]
  threshold = [0,0.079]
  probability = 0.4
}

degradation {
  type = "blur"
  filter = ["box", "gauss","lens"]
  kernel = [0, 1]
  target_kernel = {
    box = [0,2]
    gauss = [0,2]
    lens =[1,2]
  }
  probability = 0.15
}

degradation {
  type = "noise"
  type_noise = ["uniform", "gauss"]
  y_noise = 0.3
  uv_noise = 0.1
  alpha = [0.1,0.3,0.05]
  bias =  [-0.1, 0.1]
  probability =  0.35
}

laplace_filter = 0.02
num_workers = 8
map_type = "thread"