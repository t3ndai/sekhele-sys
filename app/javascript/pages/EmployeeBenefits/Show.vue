<template>
    <div>
        <h2> {{ benefit.name }} Plans</h2>

        <DataTable :value="benefit_plans" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="employee_contribution" header="Employee Contribution"></Column>
            <Column field="cover" header="Covers"></Column>
            <Column header="Actions">
                <template #body="slotProps">
                    <div class="flex gap-x-2">
                        <Button severity="secondary">
                            Details
                        </Button>
                        <Button>
                            Select Plan
                        </Button>
                    </div>
                </template>
            </Column>

        </DataTable>

    </div>
</template>

<script setup>
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

defineProps({
    benefit: Object,
    benefit_plans: Array
})

</script>