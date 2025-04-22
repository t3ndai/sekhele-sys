<template>
  <Head title="Assets" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Assets</h1>

  <div>
    <div v-for="asset in assets" :key="asset.id">
      <Asset :asset="asset" />
      <p>
        <Link :href="`/assets/${asset.id}`">Show this asset</Link>
      </p>
    </div>
  </div>

  <Link href="/assets/new">New asset</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Asset from './Asset.vue'

const { assets, flash } = defineProps(['assets', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
