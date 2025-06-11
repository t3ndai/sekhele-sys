<template>
  <Head title="Editing new joiner" />

  <h1>Editing new joiner</h1>

  <Form
    :new_joiner="new_joiner"
    submitText="Update New joiner"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/new_joiners/${new_joiner.id}`">Show this new joiner</Link> |
    <Link href="/new_joiners">Back to new joiners</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { new_joiner } = defineProps(['new_joiner'])

const handleSubmit = (form) => {
  form.transform((data) => ({ new_joiner: data }))
  form.patch(`/new_joiners/${new_joiner.id}`)
}
</script>
