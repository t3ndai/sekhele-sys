<template>

  <Head :title="`New joiner #${new_joiner.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>New joiner #{{ new_joiner.id }}</h1>

  <NewJoiner :new_joiner="new_joiner" />

  <div>
    <Link :href="`/new_joiners/${new_joiner.id}/onboarding_events/new`"
      class="bg-sky-600 hover:bg-sky-700 text-white p-2 rounded">
    New Onboarding event
    </Link>
  </div>

  <div>
    <Link :href="`/new_joiners/${new_joiner.id}/edit`">Edit this new joiner</Link> |
    <Link href="/new_joiners">Back to new joiners</Link>

    <br />

    <Link :href="`/new_joiners/${new_joiner.id}`" as="button" method="delete">
    Destroy this new joiner
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import NewJoiner from './NewJoiner.vue'

const { new_joiner, flash } = defineProps(['new_joiner', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
