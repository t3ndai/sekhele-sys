<template>
  <Head title="Editing onboard checklist" />

  <h1>Editing onboard checklist</h1>

  <Form
    :onboard_checklist="onboard_checklist"
    submitText="Update Onboard checklist"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/onboard_checklists/${onboard_checklist.id}`">Show this onboard checklist</Link> |
    <Link href="/onboard_checklists">Back to onboard checklists</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboard_checklist } = defineProps(['onboard_checklist'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboard_checklist: data }))
  form.patch(`/onboard_checklists/${onboard_checklist.id}`)
}
</script>
