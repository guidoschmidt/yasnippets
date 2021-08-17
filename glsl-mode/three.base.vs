# -*- mode: snippet -*-
# name: three.js base vertex shader
# key: three-base-vs
# --
varying vec2 vUv;

void main() {
  vUv = uv;
  gl_Position = vec4(position.xy, -.041, 1.0);
}