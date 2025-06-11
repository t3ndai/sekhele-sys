<template>
  <Head title="New joiners" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>New joiners</h1>

  <div>
    <div v-for="new_joiner in new_joiners" :key="new_joiner.id">
      <NewJoiner :new_joiner="new_joiner" />
      <p>
        <Link :href="`/new_joiners/${new_joiner.id}`">Show this new joiner</Link>
      </p>
    </div>
  </div>

  <Link href="/new_joiners/new">New new joiner</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import NewJoiner from './NewJoiner.vue'

const { new_joiners, flash } = defineProps(['new_joiners', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
