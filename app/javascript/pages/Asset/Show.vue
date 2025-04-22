<template>
  <Head :title="`Asset #${asset.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Asset #{{ asset.id }}</h1>

  <Asset :asset="asset" />

  <div>
    <Link :href="`/assets/${asset.id}/edit`">Edit this asset</Link> |
    <Link href="/assets">Back to assets</Link>

    <br />

    <Link
      :href="`/assets/${asset.id}`"
      as="button"
      method="delete"
    >
      Destroy this asset
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Asset from './Asset.vue'

const { asset, flash } = defineProps(['asset', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
