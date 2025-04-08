<template>
  <Head title="New employee job" />

  <h1>New employee job</h1>

  <Form
    :employee_job="employee_job"
    submitText="Create Employee job"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link href="/employee_jobs">Back to employee jobs</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { employee_job } = defineProps(['employee_job'])

const handleSubmit = (form) => {
  form.transform((data) => ({ employee_job: data }))
  form.post('/employee_jobs')
}
</script>
