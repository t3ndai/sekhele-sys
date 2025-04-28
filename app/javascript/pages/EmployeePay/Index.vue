<template>
  <Head title="Employee pays" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Employee pays</h1>

  <div>
    <div v-for="employee_pay in employee_pays" :key="employee_pay.id">
      <EmployeePay :employee_pay="employee_pay" />
      <p>
        <Link :href="`/employee_pays/${employee_pay.id}`">Show this employee pay</Link>
      </p>
    </div>
  </div>

  <Link href="/employee_pays/new">New employee pay</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import EmployeePay from './EmployeePay.vue'

const { employee_pays, flash } = defineProps(['employee_pays', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
