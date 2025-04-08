<template>
  <Head title="Employee jobs" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Employee jobs</h1>

  <div>
    <div v-for="employee_job in employee_jobs" :key="employee_job.id">
      <EmployeeJob :employee_job="employee_job" />
      <p>
        <Link :href="`/employee_jobs/${employee_job.id}`">Show this employee job</Link>
      </p>
    </div>
  </div>

  <Link href="/employee_jobs/new">New employee job</Link>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import EmployeeJob from './EmployeeJob.vue'

const { employee_jobs, flash } = defineProps(['employee_jobs', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
