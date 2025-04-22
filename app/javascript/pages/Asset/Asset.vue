<template>
  <div>
    <p>
      <strong>Organization:</strong>
      {{ asset.organization_id }}
    </p>
    <p>
      <strong>Asset category:</strong>
      {{ asset.asset_category_id }}
    </p>
    <p>
      <strong>Name:</strong>
      {{ asset.name }}
    </p>
    <p>
      <strong>Serial number:</strong>
      {{ asset.serial_number }}
    </p>
    <p>
      <strong>Status:</strong>
      {{ asset.status }}
    </p>
  </div>
</template>

<script setup>
const { asset } = defineProps(['asset'])
</script>
