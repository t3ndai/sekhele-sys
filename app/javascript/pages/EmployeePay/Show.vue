<template>
  <Head :title="`Employee pay #${employee_pay.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Employee pay #{{ employee_pay.id }}</h1>

  <EmployeePay :employee_pay="employee_pay" />

  <div>
    <Link :href="`/employee_pays/${employee_pay.id}/edit`">Edit this employee pay</Link> |
    <Link href="/employee_pays">Back to employee pays</Link>

    <br />

    <Link
      :href="`/employee_pays/${employee_pay.id}`"
      as="button"
      method="delete"
    >
      Destroy this employee pay
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import EmployeePay from './EmployeePay.vue'

const { employee_pay, flash } = defineProps(['employee_pay', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
