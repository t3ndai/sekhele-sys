<template>
  <Head :title="`Employee job #${employee_job.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Employee job #{{ employee_job.id }}</h1>

  <EmployeeJob :employee_job="employee_job" />

  <div>
    <Link :href="`/employee_jobs/${employee_job.id}/edit`">Edit this employee job</Link> |
    <Link href="/employee_jobs">Back to employee jobs</Link>

    <br />

    <Link
      :href="`/employee_jobs/${employee_job.id}`"
      as="button"
      method="delete"
    >
      Destroy this employee job
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import EmployeeJob from './EmployeeJob.vue'

const { employee_job, flash } = defineProps(['employee_job', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
