input = "../DF2K_BHI_HR"
output = "../DF2K_BHI_LR_PreTrain"
#input = "../test"
#output = "../test_LR_Finetune"



degradation {
  type = "resize"
  alg_lq = ["box", "hermite", "linear", "lagrange", "cubic_catrom", "cubic_mitchell", "cubic_bspline",
    "lanczos", "gauss", "down_up", "down_down", "up_down"]
  alg_hq = ["lagrange"]
  down_up = {
    down = [1, 2]
    alg_up = ["nearest", "box", "hermite", "linear", "lagrange", "cubic_catrom", "cubic_mitchell",
      "cubic_bspline", "lanczos", "gauss", "down_down"]
    alg_down = [ "hermite", "linear",  "lagrange", "cubic_catrom", "cubic_mitchell", "cubic_bspline",
      "lanczos", "gauss"]
  }
  up_down = {
    up = [1, 2]
    alg_up = ["nearest", "box", "hermite", "linear", "lagrange", "cubic_catrom", "cubic_mitchell",
      "cubic_bspline", "lanczos", "gauss"]
    alg_down = [ "hermite", "linear",  "lagrange", "cubic_catrom", "cubic_mitchell", "cubic_bspline",
      "lanczos", "gauss","down_down"]
  }
  down_down = {
    step = [1, 6]
    alg_down = [ "linear", "lagrange", "cubic_catrom", "cubic_mitchell", "cubic_bspline"]
  }


  scale = 2
  color_fix = true
  gamma_correction = false
}


degradation {
  type = "pixelate"
  size = [0, 4]
  probability = 0.1
}


degradation {
  type = "blur"
  filter = ["box", "gauss", "median","lens","motion","random"]
  kernel = [0, 1]
  target_kernel = {
    box = [0,1]
    gauss = [0,1]
    median = [0,1]
    lens =[0,1]
    random = [0,1]
  }
  motion_size = [0,10]
  motion_angle = [-30,30]
  probability = 0.1
}

degradation {
  type ="compress"
  algorithm = ["h264", "hevc", "mpeg2", "vp9"]
  jpeg_sampling = [
    "4:4:4", "4:4:0", "4:2:2", "4:2:0"
  ]
  target_compress = {
    h264 = [18,30]
    av1 = [18,30]
    hevc = [18,30]
    mpeg = [2,20]
    mpeg2 = [2,30]
    vp9 = [18,30]
    jpeg = [40,100]
    webp = [40,100]
  }
  compress = [40, 100]
  probability = 0.6
}
laplace_filter = 0.02
size = 100000000
shuffle_dataset = false
num_workers = 16
map_type = "thread"
debug = false
only_lq = false
real_name = false
out_clear = true

gray = false
