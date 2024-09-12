<script setup lang="ts">
import { ref, onMounted, render } from "vue";
import {
AmbientLight,
  AxesHelper,
  BoxGeometry,
  Color,
  DirectionalLight,
  Light,
  Mesh,
  MeshBasicMaterial,
  MeshStandardMaterial,
  PerspectiveCamera,
  Scene,
  SpotLight,
  WebGLRenderer,
} from "three";
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import Stats from "three/examples/jsm/libs/stats.module";

const target = ref();

const scene = new Scene();
scene.background = new Color('white')
scene.add(new AxesHelper(5));
const camera = new PerspectiveCamera(
  120,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);
camera.position.z = -9;
camera.position.y = -21;
camera.position.x = -9;
// const spot = new SpotLight(0xffffff, 3);
// camera.add(spot);
const ambientLight = new AmbientLight(0xffffff, 3);
const mainLight = new DirectionalLight(0xffffff, 4.0);
mainLight.position.set(10, 10, 10);
scene.add(ambientLight, mainLight);
     
const renderer = new WebGLRenderer();
renderer.shadowMap.enabled = true;
renderer.setSize(window.innerWidth, window.innerHeight);

// const geometry = new BoxGeometry(1, 1, 1);
// const material = new MeshBasicMaterial({ color: 0x00ff00 });
// const cube = new Mesh(geometry, material);
// scene.add(cube);

// function animate() {
//   requestAnimationFrame(animate);

//   cube.rotation.x += 0.01;
//   cube.rotation.y += 0.01;

//   renderer.render(scene, camera);
// }

const controls = new OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;

const loader = new GLTFLoader();
loader.load(
  "/public/models/Sting-Sword.gltf",
  function (gltf) {
    // gltf.scene.traverse(function (child) {
    //   console.warn('child ',child );
    //   if ((child as Mesh).isMesh) {
    //     const m = child as Mesh
    //     m.receiveShadow = true
    //     m.castShadow = true
    //   }
    //   if ((child as Light).isLight) {
    //     const l = child as SpotLight
    //     l.castShadow = true
    //     l.shadow.bias = -0.003
    //     l.shadow.mapSize.width = 2048
    //     l.shadow.mapSize.height = 2048
    //   }
    // })
    
    scene.add(gltf.scene);
  },
  (xhr) => {
    console.log((xhr.loaded / xhr.total) * 100 + "% loaded");
  },
  (error) => {
    console.log('An error happened ',error);
  }
);
const mesh = scene.children;
console.warn('mesh', mesh);
// const material = new MeshBasicMaterial({color:0xffff00})
// const mesh = new Mesh(gltf.scene, material)
// scene.add( mesh );
window.addEventListener('resize', onWindowResize, false)
function onWindowResize() {
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()
  renderer.setSize(window.innerWidth, window.innerHeight)
  render()
}

const stats = new Stats()
document.body.appendChild(stats.dom)

function animate(){
  requestAnimationFrame(animate);
  controls.update();
  render();
  stats.update()
}

function render(){
  renderer.render(scene, camera)
}

onMounted(() => {
  target.value.appendChild(renderer.domElement);
  animate();
});
</script>

<template>
  <div ref="target"></div>
</template>
