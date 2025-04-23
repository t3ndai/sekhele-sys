<template>
    <div>
        <div>
            <Button
                label="New Job Function"
                icon="pi pi-plus"
                @click="visible = true"
                class="asset-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Job Function"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveAsset">
                <div class="flex flex-col mb-2">
                    <label class="label" for="title">Title</label>
                    <InputText name="title" id="title" v-model="form.title" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.title.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Department"
                        :options="departments"
                        optionLabel="name"
                        optionValue="id"
                        v-model="form.department_id"
                    />
                    <div v-if="form.errors.department_id" class="error">
                        {{ form.errors.department_id.join(", ") }}
                    </div>
                </div>

                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Minimum Salary</label
                    >
                    <InputNumber
                        name="salary_range_min"
                        id="salary_range_min"
                        v-model="form.salary_range_min"
                    />
                    <div v-if="form.errors.salary_range_min" class="error">
                        {{ form.errors.salary_range_min.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Maximum Salary</label
                    >
                    <InputNumber
                        name="salary_range_max"
                        id="salary_range_max"
                        v-model="form.salary_range_max"
                    />
                    <div v-if="form.errors.salary_range_max" class="error">
                        {{ form.errors.salary_range_max.join(", ") }}
                    </div>
                </div>
                <div>
                    <Button
                        type="submit"
                        :disabled="form.processing"
                        label="Save Job Function"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, InputText, Button, InputNumber } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    title: "",
    salary_range_min: "",
    salary_range_max: "",
    department_id: "",
});

const visible = ref(false);

defineProps({
    departments: Array,
});

function saveAsset() {
    form.transform((data) => ({ job_function: data }));
    form.post(`/organizations/${org_id}/job_functions`, {
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
