<template>

  <Head title="New onboarding event" />

  <div class="font-belgrano text-4xl">Onboarding Event: {{ new_joiner.name }}</div>

  <div class="text-2xl">Where, Who & When</div>

  <Form :onboarding_event="onboarding_event" :contacts submitText="Create Onboarding event" @onSubmit="handleSubmit" />

  <br />

  <div>
    <Link href="/onboarding_events">Back to onboarding events</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboarding_event, new_joiner, contacts } = defineProps(['onboarding_event', 'new_joiner', 'contacts'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboarding_event: data }))
  form.post(`/new_joiners/${new_joiner.id}/onboarding_events`)
}
</script>
