<template>
    <div>
        <div>
            <Button
                label="New Asset"
                icon="pi pi-plus"
                @click="visible = true"
                class="asset-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Asset"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveAsset">
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select an Asset Category"
                        :options="asset_categories"
                        optionLabel="name"
                        optionValue="id"
                        v-model="form.asset_category_id"
                    />
                    <div v-if="form.errors.asset_category_id" class="error">
                        {{ form.errors.asset_category_id.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="name">Name</label>
                    <InputText name="name" id="name" v-model="form.name" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.name.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Serial number</label
                    >
                    <InputText
                        name="serial_number"
                        id="serial_number"
                        v-model="form.serial_number"
                    />
                    <div v-if="form.errors.serial_number" class="error">
                        {{ form.errors.serial_number.join(", ") }}
                    </div>
                </div>
                <div>
                    <Button
                        type="submit"
                        :disabled="form.processing"
                        label="Save Asset"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, InputText, Button } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    serial_number: "",
    asset_category_id: "",
});

const visible = ref(false);

defineProps({
    asset_categories: Array,
});

function saveAsset() {
    form.post(`/organizations/${org_id}/assets`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.asset-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
