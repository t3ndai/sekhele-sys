<template>
    <div>
        <div>
            <Button
                label="New Leave Policy"
                icon="pi pi-plus"
                @click="visible = true"
                class="leave-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Leave Policy"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveLeavePolicy">
                <div class="flex flex-col mb-2">
                    <label class="label" for="name">Name</label>
                    <InputText name="name" id="name" v-model="form.name" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.name.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Leave Category"
                        :options="leave_categories"
                        optionLabel="name"
                        optionValue="id"
                        v-model="form.leave_category_id"
                    />
                    <div v-if="form.errors.leave_category_id" class="error">
                        {{ form.errors.leave_category_id.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Start Balance</label
                    >
                    <InputNumber
                        name="start_balance"
                        id="start_balance"
                        v-model="form.start_balance"
                    />
                    <div v-if="form.errors.start_balance" class="error">
                        {{ form.errors.start_balance.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number">Valid From</label>
                    <input
                        type="date"
                        name="valid_from"
                        id="valid_from"
                        class="form-control"
                        v-model="form.valid_from"
                    />
                    <div v-if="form.errors.valid_from" class="error">
                        {{ form.errors.valid_from.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number">Valid To</label>
                    <input
                        type="date"
                        name="valid_to"
                        id="valid_to"
                        class="form-control"
                        v-model="form.valid_to"
                    />
                    <div v-if="form.errors.valid_to" class="error">
                        {{ form.errors.valid_to.join(", ") }}
                    </div>
                </div>
                <div>
                    <Button
                        class="leave-btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Leave Policy"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import {
    Dialog,
    Select,
    InputText,
    Button,
    InputNumber,
    DatePicker,
} from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    leave_category_id: "",
    start_balance: 0,
    valid_from: "",
    valid_to: "",
});

const visible = ref(false);

defineProps({
    leave_categories: Array,
});

function saveLeavePolicy() {
    form.transform((data) => ({ leave_policy: data }));
    form.post(`/organizations/${org_id}/leave_policies`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.leave-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
