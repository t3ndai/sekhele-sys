<template>

  <Head title="New onboard checklist" />

  <h1>New onboard checklist</h1>

  <Form :onboard_checklist="onboard_checklist" submitText="Create Onboard checklist" @onSubmit="handleSubmit" />

  <br />

  <div>
    <Link href="/onboard_checklists">Back to New Joiner</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboard_checklist, new_joiner_id } = defineProps(['onboard_checklist', 'new_joiner_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboard_checklist: data }))
  form.post(`/new_joiners/${new_joiner_id}/onboard_checklists`)
}
</script>
