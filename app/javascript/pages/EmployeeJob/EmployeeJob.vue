<template>
  <div>
    <p>
      <strong>Job function:</strong>
      {{ employee_job.job_function_id }}
    </p>
    <p>
      <strong>Employee:</strong>
      {{ employee_job.employee_id }}
    </p>
    <p>
      <strong>Job level:</strong>
      {{ employee_job.job_level_id }}
    </p>
    <p>
      <strong>Started on:</strong>
      {{ employee_job.started_on }}
    </p>
    <p>
      <strong>Ended on:</strong>
      {{ employee_job.ended_on }}
    </p>
  </div>
</template>

<script setup>
const { employee_job } = defineProps(['employee_job'])
</script>
