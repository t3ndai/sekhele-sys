<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="organization">Organization</label>
      <input type="text" name="organization" id="organization" v-model="form.organization_id" />
      <div v-if="form.errors.organization_id" class="error">
        {{ form.errors.organization_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="asset_category">Asset category</label>
      <input type="text" name="asset_category" id="asset_category" v-model="form.asset_category_id" />
      <div v-if="form.errors.asset_category_id" class="error">
        {{ form.errors.asset_category_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="name">Name</label>
      <input type="text" name="name" id="name" v-model="form.name" />
      <div v-if="form.errors.name" class="error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="serial_number">Serial number</label>
      <input type="text" name="serial_number" id="serial_number" v-model="form.serial_number" />
      <div v-if="form.errors.serial_number" class="error">
        {{ form.errors.serial_number.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="status">Status</label>
      <input type="text" name="status" id="status" v-model="form.status" />
      <div v-if="form.errors.status" class="error">
        {{ form.errors.status.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { asset, submitText } = defineProps(['asset', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  organization_id: asset.organization_id || '',
  asset_category_id: asset.asset_category_id || '',
  name: asset.name || '',
  serial_number: asset.serial_number || '',
  status: asset.status || '',
})
</script>

<style scoped>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
