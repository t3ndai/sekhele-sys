<template>
  <Head title="New employee pay" />

  <h1>New employee pay</h1>

  <Form
    :employee_pay="employee_pay"
    submitText="Create Employee pay"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link href="/employee_pays">Back to employee pays</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { employee_pay } = defineProps(['employee_pay'])

const handleSubmit = (form) => {
  form.transform((data) => ({ employee_pay: data }))
  form.post('/employee_pays')
}
</script>
