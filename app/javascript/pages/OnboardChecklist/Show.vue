<template>
  <Head :title="`Onboard checklist #${onboard_checklist.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Onboard checklist #{{ onboard_checklist.id }}</h1>

  <OnboardChecklist :onboard_checklist="onboard_checklist" />

  <div>
    <Link :href="`/onboard_checklists/${onboard_checklist.id}/edit`">Edit this onboard checklist</Link> |
    <Link href="/onboard_checklists">Back to onboard checklists</Link>

    <br />

    <Link
      :href="`/onboard_checklists/${onboard_checklist.id}`"
      as="button"
      method="delete"
    >
      Destroy this onboard checklist
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import OnboardChecklist from './OnboardChecklist.vue'

const { onboard_checklist, flash } = defineProps(['onboard_checklist', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
