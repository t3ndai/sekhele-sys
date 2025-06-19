<template>
  <Head title="Editing onboard task" />

  <h1>Editing onboard task</h1>

  <Form
    :onboard_task="onboard_task"
    submitText="Update Onboard task"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/onboard_tasks/${onboard_task.id}`">Show this onboard task</Link> |
    <Link href="/onboard_tasks">Back to onboard tasks</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboard_task } = defineProps(['onboard_task'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboard_task: data }))
  form.patch(`/onboard_tasks/${onboard_task.id}`)
}
</script>
