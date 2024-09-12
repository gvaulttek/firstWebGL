<script setup lang="ts">
import { PerspectiveCamera, Scene, WebGLRenderer } from "three";
import { onMounted, ref } from "vue";

const experience = ref<HTMLCanvasElement | null>(null);
const scene = new Scene();
const camera = new PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);
scene.add(camera);
onMounted(() => {
  const renderer = new WebGLRenderer({
    canvas: experience.value as unknown as HTMLCanvasElement,
    antialias: true,
  });
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.render(scene, camera);
});
</script>

<template>
  <canvas ref="experience" />
</template>

<style scoped>
/* html,
body {
  margin: 0;
  padding: 0;
  height: 100%;
  width: 100%;
}
#app {
  height: 100%;
  width: 100%;
} */
</style>
