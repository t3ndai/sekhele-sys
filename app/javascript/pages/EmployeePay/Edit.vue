<template>
  <Head title="Editing employee pay" />

  <h1>Editing employee pay</h1>

  <Form
    :employee_pay="employee_pay"
    submitText="Update Employee pay"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/employee_pays/${employee_pay.id}`">Show this employee pay</Link> |
    <Link href="/employee_pays">Back to employee pays</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { employee_pay } = defineProps(['employee_pay'])

const handleSubmit = (form) => {
  form.transform((data) => ({ employee_pay: data }))
  form.patch(`/employee_pays/${employee_pay.id}`)
}
</script>
