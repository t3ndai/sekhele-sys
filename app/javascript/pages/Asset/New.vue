<template>
  <Head title="New asset" />

  <h1>New asset</h1>

  <Form
    :asset="asset"
    submitText="Create Asset"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link href="/assets">Back to assets</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { asset } = defineProps(['asset'])

const handleSubmit = (form) => {
  form.transform((data) => ({ asset: data }))
  form.post('/assets')
}
</script>
