<template>
  <Head title="Onboard checklists" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboard checklists</h1>

  <div>
    <div v-for="onboard_checklist in onboard_checklists" :key="onboard_checklist.id">
      <OnboardChecklist :onboard_checklist="onboard_checklist" />
      <p>
        <Link :href="`/onboard_checklists/${onboard_checklist.id}`">Show this onboard checklist</Link>
      </p>
    </div>
  </div>

  <Link href="/onboard_checklists/new">New onboard checklist</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardChecklist from './OnboardChecklist.vue'

const { onboard_checklists, flash } = defineProps(['onboard_checklists', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
