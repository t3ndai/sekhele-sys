<template>
  <Head title="Editing employee job" />

  <h1>Editing employee job</h1>

  <Form
    :employee_job="employee_job"
    submitText="Update Employee job"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/employee_jobs/${employee_job.id}`">Show this employee job</Link> |
    <Link href="/employee_jobs">Back to employee jobs</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { employee_job } = defineProps(['employee_job'])

const handleSubmit = (form) => {
  form.transform((data) => ({ employee_job: data }))
  form.patch(`/employee_jobs/${employee_job.id}`)
}
</script>
