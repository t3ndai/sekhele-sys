<template>
  <Head title="Editing onboarding event" />

  <h1>Editing onboarding event</h1>

  <Form
    :onboarding_event="onboarding_event"
    submitText="Update Onboarding event"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/onboarding_events/${onboarding_event.id}`">Show this onboarding event</Link> |
    <Link href="/onboarding_events">Back to onboarding events</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboarding_event } = defineProps(['onboarding_event'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboarding_event: data }))
  form.patch(`/onboarding_events/${onboarding_event.id}`)
}
</script>
