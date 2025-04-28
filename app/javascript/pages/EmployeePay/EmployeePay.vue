<template>
  <div>
    <p>
      <strong>Employee:</strong>
      {{ employee_pay.employee_id }}
    </p>
    <p>
      <strong>Start date:</strong>
      {{ employee_pay.start_date }}
    </p>
    <p>
      <strong>End date:</strong>
      {{ employee_pay.end_date }}
    </p>
    <p>
      <strong>Amount:</strong>
      {{ employee_pay.amount }}
    </p>
    <p>
      <strong>Pay type:</strong>
      {{ employee_pay.pay_type }}
    </p>
    <p>
      <strong>Currency:</strong>
      {{ employee_pay.currency }}
    </p>
    <p>
      <strong>Frequency:</strong>
      {{ employee_pay.frequency }}
    </p>
  </div>
</template>

<script setup>
const { employee_pay } = defineProps(['employee_pay'])
</script>
