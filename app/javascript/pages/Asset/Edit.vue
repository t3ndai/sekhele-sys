<template>
  <Head title="Editing asset" />

  <h1>Editing asset</h1>

  <Form
    :asset="asset"
    submitText="Update Asset"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/assets/${asset.id}`">Show this asset</Link> |
    <Link href="/assets">Back to assets</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { asset } = defineProps(['asset'])

const handleSubmit = (form) => {
  form.transform((data) => ({ asset: data }))
  form.patch(`/assets/${asset.id}`)
}
</script>
