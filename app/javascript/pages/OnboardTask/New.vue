<template>
  <Head title="New onboard task" />

  <h1>New onboard task</h1>

  <Form
    :onboard_task="onboard_task"
    submitText="Create Onboard task"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link href="/onboard_tasks">Back to onboard tasks</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { onboard_task } = defineProps(['onboard_task'])

const handleSubmit = (form) => {
  form.transform((data) => ({ onboard_task: data }))
  form.post('/onboard_tasks')
}
</script>
